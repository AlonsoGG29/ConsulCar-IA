import React, { useState, useEffect } from 'react';
import './index.css';
import CarCard from './components/CarCard';
import Filters from './components/Filters';

function App() {
  const [cars, setCars] = useState([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');

  const [filters, setFilters] = useState({
    potencia_min: '',
    consumo_max: '',
    combustible: [],
    autonomia_min: '',
    largo_max: '',
    maletero_min: '',
  });

  const fetchCars = async () => {
    setLoading(true);
    try {
      const queryParams = new URLSearchParams();
      if (search) queryParams.append('busqueda', search);

      Object.entries(filters).forEach(([key, value]) => {
        if (Array.isArray(value)) {
          value.forEach(v => queryParams.append(key, v));
        } else if (value) {
          queryParams.append(key, value);
        }
      });

      const response = await fetch(`http://127.0.0.1:8000/api/coches?${queryParams.toString()}`);
      let data = await response.json();
      data = data.sort(() => Math.random() - 0.5);
      setCars(data);
    } catch (error) {
      console.error('Error fetching cars:', error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    const timer = setTimeout(fetchCars, 500);
    return () => clearTimeout(timer);
  }, [filters, search]);

  return (
    <div className="app-wrapper">
      {/* ── HEADER ── */}
      <header className="site-header">
        <div className="header-brand">
          <div className="header-icon">🏎️</div>
          <div className="header-titles">
            <h1>Consultor<span>Coches</span></h1>
            <p>Encuentra tu coche ideal por necesidades reales</p>
          </div>
        </div>

        <div className="header-search">
          <span className="search-icon">🔍</span>
          <input
            type="text"
            placeholder="Buscar modelo… Ibiza, Tucson, EX30…"
            value={search}
            onChange={e => setSearch(e.target.value)}
          />
        </div>

        <div className="results-badge">
          {loading ? 'Buscando…' : <><strong>{cars.length}</strong> coches</>}
        </div>
      </header>

      {/* ── LAYOUT ── */}
      <div className="main-layout">
        <aside className="sidebar">
          <Filters filters={filters} setFilters={setFilters} />
        </aside>

        <section className="content-area">
          {loading ? (
            <div className="loading-state">
              <div className="spinner" />
              <p>Buscando coches…</p>
            </div>
          ) : cars.length > 0 ? (
            <div className="car-grid">
              {cars.map(car => <CarCard key={`${car.id_modelo}-${car.id_marca}`} car={car} />)}
            </div>
          ) : (
            <div className="no-results">
              <span className="no-results-icon">🔍</span>
              <strong>Sin resultados</strong>
              <p>Prueba a ampliar los filtros para ver más coches.</p>
            </div>
          )}
        </section>
      </div>
    </div>
  );
}

export default App;
