import React, { useState } from 'react';

const FUEL_LABELS = {
  'Gasolina':  'Gasolina',
  'Diésel':    'Diésel',
  'GLP':       'GLP',
  'Hidrógeno': 'H₂',
  'MHEV':      'Mild-Hybrid',
  'HEV':       'Híbrido',
  'PHEV':      'Enchufable',
  'Eléctrico': 'Eléctrico',
};

// ── Reutilizable: slider simple ───────────────────────────────────────────────
const SliderBlock = ({ label, name, min, max, step, unit, defaultVal, filters, onChange }) => {
  const val = filters[name] || defaultVal;
  return (
    <div className="filter-block">
      <div className="filter-label-row">
        <span className="filter-label-text">{label}</span>
        <span className="filter-label-value">{Number(val).toLocaleString('es-ES')} {unit}</span>
      </div>
      <input type="range" name={name} min={min} max={max} step={step} value={val} onChange={onChange} />
    </div>
  );
};

// ── Rango de precio ───────────────────────────────────────────────────────────
const PriceRange = ({ filters, setFilters }) => {
  const MIN_PRICE = 0;
  const MAX_PRICE = 200000;
  const STEP      = 1000;

  const pMin = Number(filters.precio_min) || MIN_PRICE;
  const pMax = Number(filters.precio_max) || MAX_PRICE;

  const fmt = v => `${Number(v).toLocaleString('es-ES')} €`;

  const handleMin = e => {
    const v = Math.min(Number(e.target.value), pMax - STEP);
    setFilters(prev => ({ ...prev, precio_min: v === MIN_PRICE ? '' : v }));
  };

  const handleMax = e => {
    const v = Math.max(Number(e.target.value), pMin + STEP);
    setFilters(prev => ({ ...prev, precio_max: v === MAX_PRICE ? '' : v }));
  };

  return (
    <div className="filter-block">
      <div className="filter-label-row">
        <span className="filter-label-text">Precio</span>
        <span className="filter-label-value">{fmt(pMin)} – {fmt(pMax)}</span>
      </div>
      <div className="price-range-track">
        <input type="range" min={MIN_PRICE} max={MAX_PRICE} step={STEP} value={pMin} onChange={handleMin} className="price-slider price-slider-min" />
        <input type="range" min={MIN_PRICE} max={MAX_PRICE} step={STEP} value={pMax} onChange={handleMax} className="price-slider price-slider-max" />
        <div
          className="price-range-fill"
          style={{
            left:  `${(pMin / MAX_PRICE) * 100}%`,
            right: `${100 - (pMax / MAX_PRICE) * 100}%`,
          }}
        />
      </div>
    </div>
  );
};

// ── Marcas (pills con buscador) ───────────────────────────────────────────────
const BrandFilter = ({ marcasList, filters, setFilters }) => {
  const [brandSearch, setBrandSearch] = useState('');

  const filtered = marcasList.filter(m =>
    m.nombre.toLowerCase().includes(brandSearch.toLowerCase())
  );

  const toggle = (id) => {
    setFilters(prev => {
      const current = Array.isArray(prev.marca) ? prev.marca : [];
      return {
        ...prev,
        marca: current.includes(id)
          ? current.filter(x => x !== id)
          : [...current, id],
      };
    });
  };

  return (
    <div className="filter-block">
      <div className="filter-label-row">
        <span className="filter-label-text">Marcas</span>
        {filters.marca.length > 0 && (
          <span className="filter-label-value">{filters.marca.length} sel.</span>
        )}
      </div>
      <input
        type="text"
        className="brand-search-input"
        placeholder="Buscar marca…"
        value={brandSearch}
        onChange={e => setBrandSearch(e.target.value)}
      />
      <div className="fuel-pills brand-pills">
        {filtered.map(m => (
          <span key={m.id_marca} className="fuel-pill">
            <input
              type="checkbox"
              id={`marca-${m.id_marca}`}
              checked={filters.marca.includes(m.id_marca)}
              onChange={() => toggle(m.id_marca)}
            />
            <label htmlFor={`marca-${m.id_marca}`}>{m.nombre}</label>
          </span>
        ))}
      </div>
    </div>
  );
};

// ── Filtros principales ───────────────────────────────────────────────────────
const Filters = ({ filters, setFilters, marcasList }) => {
  const handleRange = e => {
    const { name, value } = e.target;
    setFilters(prev => ({ ...prev, [name]: value }));
  };

  const toggleFuel = tipo => {
    setFilters(prev => {
      const current = Array.isArray(prev.combustible) ? prev.combustible : [];
      return {
        ...prev,
        combustible: current.includes(tipo)
          ? current.filter(c => c !== tipo)
          : [...current, tipo],
      };
    });
  };

  return (
    <div>
      <p className="filters-title">Filtros</p>

      {/* Precio */}
      <PriceRange filters={filters} setFilters={setFilters} />

      <hr className="filter-divider" />

      {/* Marcas */}
      <BrandFilter marcasList={marcasList} filters={filters} setFilters={setFilters} />

      <hr className="filter-divider" />

      {/* Combustible */}
      <div className="filter-block">
        <div className="filter-label-row">
          <span className="filter-label-text">Combustible</span>
          {filters.combustible.length > 0 && (
            <span className="filter-label-value">{filters.combustible.length} sel.</span>
          )}
        </div>
        <div className="fuel-pills">
          {Object.entries(FUEL_LABELS).map(([valor, etiqueta]) => (
            <span key={valor} className="fuel-pill">
              <input
                type="checkbox"
                id={`fuel-${valor}`}
                checked={filters.combustible.includes(valor)}
                onChange={() => toggleFuel(valor)}
              />
              <label htmlFor={`fuel-${valor}`}>{etiqueta}</label>
            </span>
          ))}
        </div>
      </div>

      <hr className="filter-divider" />

      {/* Autonomía */}
      <SliderBlock label="Autonomía mínima" name="autonomia_min" min={0} max={1500} step={50} unit="km" defaultVal={0} filters={filters} onChange={handleRange} />

      <hr className="filter-divider" />

      {/* Rendimiento */}
      <SliderBlock label="Potencia mínima" name="potencia_min" min={10}   max={600} step={10}  unit="CV"      defaultVal={0}  filters={filters} onChange={handleRange} />
      <SliderBlock label="Consumo máximo"  name="consumo_max"  min={0}    max={25}  step={0.1} unit="/ 100km" defaultVal={25} filters={filters} onChange={handleRange} />

      <hr className="filter-divider" />

      {/* Dimensiones */}
      <SliderBlock label="Largo máximo"    name="largo_max"    min={3000} max={6000} step={50} unit="mm" defaultVal={6000} filters={filters} onChange={handleRange} />
      <SliderBlock label="Maletero mínimo" name="maletero_min" min={0}    max={1000} step={10} unit="L"  defaultVal={0}    filters={filters} onChange={handleRange} />
    </div>
  );
};

export default Filters;
