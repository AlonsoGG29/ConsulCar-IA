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
          min="50" max="600" step="10"
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
          min="0" max="15" step="0.5"
          value={filters.consumo_max || 15} 
          onChange={handleChange}
          className="slider"
        />
      </div>

      <div>
        <label>Tipo Combustible</label>
        <select name="combustible" value={filters.combustible} onChange={handleChange}>
          <option value="">Cualquiera</option>
          <option value="Gasolina">Gasolina</option>
          <option value="Diésel">Diésel</option>
          <option value="Híbrido">Híbrido</option>
          <option value="PHEV">PHEV (Enchufable)</option>
          <option value="Eléctrico">Eléctrico</option>
        </select>
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
