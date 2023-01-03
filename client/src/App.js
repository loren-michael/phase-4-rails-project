import './App.css';

function App() {
  const logo = 'https://clipartix.com/wp-content/uploads/2016/06/Movie-reel-svg-vector-file-vector-clip-art-svg-file-clipartsfree.png'

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1>Flatiron Movie Rentals</h1>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
