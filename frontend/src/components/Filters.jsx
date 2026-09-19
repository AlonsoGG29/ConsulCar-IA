import React from 'react';

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

const Filters = ({ filters, setFilters }) => {
  const handleRange = (e) => {
    const { name, value } = e.target;
    setFilters(prev => ({ ...prev, [name]: value }));
  };

  const toggleFuel = (tipo) => {
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

  const SliderBlock = ({ label, name, min, max, step, unit, defaultVal }) => {
    const val = filters[name] || defaultVal;
    return (
      <div className="filter-block">
        <div className="filter-label-row">
          <span className="filter-label-text">{label}</span>
          <span className="filter-label-value">{val} {unit}</span>
        </div>
        <input
          type="range"
          name={name}
          min={min}
          max={max}
          step={step}
          value={val}
          onChange={handleRange}
        />
      </div>
    );
  };

  return (
    <div>
      <p className="filters-title">Filtros</p>

      <SliderBlock label="Potencia mínima" name="potencia_min" min={10}   max={600}  step={10}   unit="CV"       defaultVal={0} />
      <SliderBlock label="Consumo máximo"  name="consumo_max"  min={0}    max={25}   step={0.1}  unit="/ 100km"  defaultVal={25} />

      <hr className="filter-divider" />

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

      <SliderBlock label="Autonomía mínima" name="autonomia_min" min={0} max={1500} step={50} unit="km" defaultVal={0} />

      <hr className="filter-divider" />

      <SliderBlock label="Largo máximo"    name="largo_max"    min={3000} max={6000} step={50}  unit="mm" defaultVal={6000} />
      <SliderBlock label="Maletero mínimo" name="maletero_min" min={0}    max={1000} step={10}  unit="L"  defaultVal={0} />
    </div>
  );
};

export default Filters;
