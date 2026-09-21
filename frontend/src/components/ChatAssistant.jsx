import React, { useState } from 'react';

const API_URL = 'http://127.0.0.1:8000';

const ChatAssistant = () => {
  const [open, setOpen] = useState(false);
  const [message, setMessage] = useState('');
  const [messages, setMessages] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const sendMessage = async event => {
    event.preventDefault();
    const content = message.trim();
    if (!content || loading) return;

    const history = messages.map(item => ({ role: item.role, content: item.content }));
    setMessages(previous => [...previous, { role: 'user', content }]);
    setMessage('');
    setError('');
    setLoading(true);

    try {
      const response = await fetch(`${API_URL}/api/chat`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ message: content, history }),
      });
      const data = await response.json();
      if (!response.ok) throw new Error(data.detail || 'No se pudo consultar al asistente.');
      setMessages(previous => [
        ...previous,
        { role: 'model', content: data.answer, sources: data.sources || [] },
      ]);
    } catch (requestError) {
      setError(requestError.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className={`chat-assistant ${open ? 'is-open' : ''}`}>
      {open && (
        <section className="chat-panel" aria-label="Chat de ConsultorCoches">
          <header className="chat-header">
            <div>
              <strong>Asistente de coches</strong>
              <span>Consulta el catálogo con lenguaje natural</span>
            </div>
            <button type="button" className="chat-close" onClick={() => setOpen(false)} aria-label="Cerrar chat">×</button>
          </header>

          <div className="chat-messages" aria-live="polite">
            {messages.length === 0 && (
              <div className="chat-empty">
                <span>✦</span>
                <p>Pregúntame por coches familiares, eléctricos, presupuesto o consumo.</p>
              </div>
            )}
            {messages.map((item, index) => (
              <div key={`${item.role}-${index}`} className={`chat-message ${item.role}`}>
                <p>{item.content}</p>
                {item.sources?.length > 0 && (
                  <small>Basado en: {item.sources.map(source => source.nombre).join(', ')}</small>
                )}
              </div>
            ))}
            {loading && <div className="chat-message model typing"><span /><span /><span /></div>}
            {error && <p className="chat-error">{error}</p>}
          </div>

          <form className="chat-form" onSubmit={sendMessage}>
            <input
              value={message}
              onChange={event => setMessage(event.target.value)}
              placeholder="¿Qué coche necesitas?"
              aria-label="Mensaje para el asistente"
              disabled={loading}
            />
            <button type="submit" aria-label="Enviar mensaje" disabled={loading || !message.trim()}>↑</button>
          </form>
        </section>
      )}
      <button type="button" className="chat-toggle" onClick={() => setOpen(previous => !previous)} aria-label={open ? 'Cerrar asistente' : 'Abrir asistente'}>
        {open ? '×' : '✦'}
      </button>
    </div>
  );
};

export default ChatAssistant;