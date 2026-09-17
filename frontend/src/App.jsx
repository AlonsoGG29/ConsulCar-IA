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
    combustible: '',
    largo_max: '',
    maletero_min: ''
  });

  const fetchCars = async () => {
    setLoading(true);
    try {
      const queryParams = new URLSearchParams();
      if (search) queryParams.append('busqueda', search);
      
      Object.entries(filters).forEach(([key, value]) => {
        if (value) {
          queryParams.append(key, value);
        }
      });

      const response = await fetch(`http://127.0.0.1:8000/api/coches?${queryParams.toString()}`);
      let data = await response.json();
      
      // Aleatorizar orden como pidió el usuario
      data = data.sort(() => Math.random() - 0.5);
      
      setCars(data);
    } catch (error) {
      console.error('Error fetching cars:', error);
    } finally {
      setLoading(false);
    }
  };

  // Debounce API calls
  useEffect(() => {
    const timer = setTimeout(() => {
      fetchCars();
    }, 500);
    return () => clearTimeout(timer);
  }, [filters, search]);

  return (
    <div className="container">
      <header>
        <h1>Comparador de Coches</h1>
        <p style={{color: 'var(--text-muted)'}}>Encuentra el coche perfecto filtrando por tus necesidades reales.</p>
      </header>

      <main className="main-content">
        <aside className="sidebar">
          <div className="search-bar">
            <input 
              type="text" 
              placeholder="Buscar por modelo (ej. Ibiza)..." 
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
          <Filters filters={filters} setFilters={setFilters} />
        </aside>

        <section className="grid-container">
          {loading ? (
            <div className="loading">Buscando coches... 🚗</div>
          ) : cars.length > 0 ? (
            <div className="car-grid">
              {cars.map(car => (
                <CarCard key={car.id_modelo} car={car} />
              ))}
            </div>
          ) : (
            <div className="no-results">
              No se han encontrado coches con estos filtros. 🥲
            </div>
          )}
        </section>
      </main>
    </div>
  );
}

export default App;
