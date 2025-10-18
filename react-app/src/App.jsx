import { BrowserRouter, Routes, Route, Link } from 'react-router-dom'
import './App.css'

function Landing() {
  return (
    <div className="landing">
      <header className="landing__header">
        <nav className="landing__nav">
          <Link to="/" className="brand">Uhaipos</Link>
          <div className="nav__links">
            <a href="#features">Features</a>
            <a href="#pricing">Pricing</a>
            <a href="#contact">Contact</a>
          </div>
        </nav>
        <div className="hero">
          <h1>Point of Sale for growing businesses</h1>
          <p>Modern, fast and reliable POS to manage sales, inventory and customers.</p>
          <div className="hero__cta">
            <a className="btn btn--primary" href="/login">Sign in</a>
            <a className="btn" href="/register">Create account</a>
          </div>
        </div>
      </header>

      <section id="features" className="section">
        <div className="section__grid">
          <div className="feature">
            <h3>Inventory control</h3>
            <p>Track stock in real-time across warehouses and channels.</p>
          </div>
          <div className="feature">
            <h3>Sales & invoicing</h3>
            <p>Sell faster at the counter and send branded invoices.</p>
          </div>
          <div className="feature">
            <h3>Reports & insights</h3>
            <p>Understand performance with daily, monthly and custom reports.</p>
          </div>
        </div>
      </section>

      <section id="pricing" className="section section--alt">
        <h2>Simple pricing</h2>
        <div className="pricing">
          <div className="card">
            <h3>Starter</h3>
            <p className="price">$0</p>
            <ul>
              <li>1 register</li>
              <li>Basic reports</li>
              <li>Email support</li>
            </ul>
          </div>
          <div className="card highlighted">
            <h3>Pro</h3>
            <p className="price">$29/mo</p>
            <ul>
              <li>Unlimited registers</li>
              <li>Advanced reports</li>
              <li>Priority support</li>
            </ul>
          </div>
        </div>
      </section>

      <footer id="contact" className="footer">
        <p>© {new Date().getFullYear()} Uhaipos. All rights reserved.</p>
      </footer>
    </div>
  )
}

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Landing />} />
      </Routes>
    </BrowserRouter>
  )
}
