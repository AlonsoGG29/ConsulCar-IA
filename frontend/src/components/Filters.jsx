import React from 'react';

const Filters = ({ filters, setFilters }) => {
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFilters(prev => ({ ...prev, [name]: value }));
  };

  return (
    <div className="filters">
      <h2>Filtros</h2>
      
      <div>
        <label>
          <span>Potencia Mínima:</span>
          <span className="filter-value">{filters.potencia_min || 0} CV</span>
        </label>
        <input 
          type="range" 
          name="potencia_min" 
          min="10" max="600" step="10"
          value={filters.potencia_min || 0} 
          onChange={handleChange}
          className="slider"
        />
      </div>

      <div>
        <label>
          <span>Consumo Máximo:</span>
          <span className="filter-value">{filters.consumo_max || 15} L/100km</span>
        </label>
        <input 
          type="range" 
          name="consumo_max" 
          min="0" max="15" step="0.1"
          value={filters.consumo_max || 15} 
          onChange={handleChange}
          className="slider"
        />
      </div>

      <div>
        <label>Tipo Combustible</label>
        <div className="checkbox-group">
          {['Gasolina', 'Diésel', 'GLP', 'Hidrógeno', 'MHEV', 'HEV', 'PHEV', 'Eléctrico'].map(tipo => (
            <label key={tipo} className="checkbox-label">
              <input 
                type="checkbox" 
                name="combustible"
                value={tipo}
                checked={filters.combustible.includes(tipo)}
                onChange={(e) => {
                  const checked = e.target.checked;
                  setFilters(prev => {
                    const currentCombustibles = Array.isArray(prev.combustible) ? prev.combustible : [];
                    if (checked) {
                      return { ...prev, combustible: [...currentCombustibles, tipo] };
                    } else {
                      return { ...prev, combustible: currentCombustibles.filter(c => c !== tipo) };
                    }
                  });
                }}
              />
              {tipo === 'MHEV' ? 'Mild-Hybrid (MHEV)' : tipo === 'HEV' ? 'Híbrido (HEV)' : tipo === 'PHEV' ? 'Híbrido Enchufable (PHEV)' : tipo}
            </label>
          ))}
        </div>
      </div>

      <div>
        <label>
          <span>Autonomía Mínima:</span>
          <span className="filter-value">{filters.autonomia_min || 0} km</span>
        </label>
        <input 
          type="range" 
          name="autonomia_min" 
          min="0" max="1500" step="50"
          value={filters.autonomia_min || 0} 
          onChange={handleChange}
          className="slider"
        />
      </div>

      <div>
        <label>
          <span>Largo Máximo:</span>
          <span className="filter-value">{filters.largo_max || 6000} mm</span>
        </label>
        <input 
          type="range" 
          name="largo_max" 
          min="3000" max="6000" step="50"
          value={filters.largo_max || 6000} 
          onChange={handleChange}
          className="slider"
        />
      </div>

      <div>
        <label>
          <span>Maletero Mínimo:</span>
          <span className="filter-value">{filters.maletero_min || 0} L</span>
        </label>
        <input 
          type="range" 
          name="maletero_min" 
          min="0" max="1000" step="10"
          value={filters.maletero_min || 0} 
          onChange={handleChange}
          className="slider"
        />
      </div>
    </div>
  );
};

export default Filters;
