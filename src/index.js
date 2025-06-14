import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';

// Добавляем вывод REACT_APP_PORT
console.log("App running on port:", process.env.REACT_APP_PORT);

ReactDOM.render(<App />, document.getElementById('root'));
registerServiceWorker();

