import React from 'react';

const CarCard = ({ car }) => {
  // Format price
  const formattedPrice = new Intl.NumberFormat('es-ES', {
    style: 'currency',
    currency: 'EUR',
    maximumFractionDigits: 0
  }).format(car.precio_base);

  const imageUrl = Array.isArray(car.fuentes_modelo) 
    ? car.fuentes_modelo[0]?.url_imagen 
    : car.fuentes_modelo?.url_imagen || 'https://via.placeholder.com/300x200?text=Coche+Sin+Imagen';

  return (
    <div className="car-card">
      <div className="car-image-container">
        <img src={imageUrl} alt={car.nombre} className="car-image" loading="lazy" />
      </div>
      <div className="car-info">
        <div className="car-brand">{car.marcas?.nombre || 'Marca Desconocida'}</div>
        <h3 className="car-model">{car.nombre}</h3>
        <div className="car-price">{formattedPrice}</div>
        
        <div className="car-specs">
          <div className="spec-item">
            <span>Potencia</span>
            <span>{car.cv ? `${car.cv} CV` : 'N/A'}</span>
          </div>
          <div className="spec-item">
            <span>Combustible</span>
            <span>{car.combustible || 'N/A'}</span>
          </div>
          <div className="spec-item">
            <span>Consumo</span>
            <span>{car.consumo ? `${car.consumo} L/100km` : 'N/A'}</span>
          </div>
          <div className="spec-item">
            <span>Maletero</span>
            <span>{car.maletero_litros ? `${car.maletero_litros} L` : 'N/A'}</span>
          </div>
          <div className="spec-item" style={{ gridColumn: '1 / -1' }}>
            <span>Medidas (LxAxA)</span>
            <span>
              {car.largo || '?'} x {car.ancho || '?'} x {car.alto || '?'} mm
            </span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default CarCard;
