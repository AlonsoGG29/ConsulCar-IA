import React from 'react';

const FUEL_BADGE = {
  'Eléctrico': 'electric',
  'PHEV':      'phev',
  'HEV':       'hev',
  'MHEV':      'mhev',
  'Gasolina':  'gasolina',
  'Diésel':    'diesel',
  'GLP':       'glp',
  'Hidrógeno': 'hidrogeno',
};

const CONSUMPTION_UNIT = (combustible) => {
  if (combustible === 'Eléctrico') return 'kWh';
  if (combustible === 'GLP' || combustible === 'Hidrógeno') return 'kg';
  return 'L';
};

const CarCard = ({ car }) => {
  const formattedPrice = new Intl.NumberFormat('es-ES', {
    style: 'currency',
    currency: 'EUR',
    maximumFractionDigits: 0,
  }).format(car.precio_base);

  const imageUrl = Array.isArray(car.fuentes_modelo)
    ? car.fuentes_modelo[0]?.url_imagen
    : car.fuentes_modelo?.url_imagen || null;

  const fuelClass = FUEL_BADGE[car.combustible] || 'gasolina';
  const consumoUnit = CONSUMPTION_UNIT(car.combustible);

  return (
    <div className="car-card">
      <div className="car-image-container">
        {imageUrl ? (
          <img src={imageUrl} alt={car.nombre} className="car-image" loading="lazy" />
        ) : (
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '100%', fontSize: '2.5rem', opacity: 0.2 }}>🚗</div>
        )}
      </div>

      <div className="car-body">
        <div className="car-meta">
          <span className="car-brand">{car.marcas?.nombre || '—'}</span>
          <span className={`fuel-badge ${fuelClass}`}>{car.combustible}</span>
        </div>

        <div className="car-name">{car.nombre} <span style={{ color: 'var(--text-dim)', fontWeight: 400, fontSize: '0.85rem' }}>{car.anio}</span></div>

        <div className="car-price">{formattedPrice} <span>pvp</span></div>

        <div className="car-specs-grid">
          <div className="spec-cell">
            <span className="spec-key">Potencia</span>
            <span className="spec-val">{car.cv ? `${car.cv} CV` : '—'}</span>
          </div>
          <div className="spec-cell">
            <span className="spec-key">Consumo</span>
            <span className="spec-val">{car.consumo ? `${car.consumo} ${consumoUnit}/100` : '—'}</span>
          </div>
          <div className="spec-cell">
            <span className="spec-key">Maletero</span>
            <span className="spec-val">{car.maletero_litros ? `${car.maletero_litros} L` : '—'}</span>
          </div>
          <div className="spec-cell">
            <span className="spec-key">Autonomía</span>
            <span className="spec-val">{car.autonomia_km ? `${car.autonomia_km} km` : '—'}</span>
          </div>
          <div className="spec-cell full">
            <span className="spec-key">Dimensiones L × A × Al</span>
            <span className="spec-val">{car.largo || '?'} × {car.ancho || '?'} × {car.alto || '?'} mm</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default CarCard;
