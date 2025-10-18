import { BrowserRouter, Routes, Route, Link } from 'react-router-dom'
import { RequireAuth, useAuth } from './auth.jsx'
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
        <Route
          path="/dashboard"
          element={(
            <RequireAuth>
              <Dashboard />
            </RequireAuth>
          )}
        />
      </Routes>
    </BrowserRouter>
  )
}

function StatCard({ title, value, color }) {
  return (
    <div className="stat-card" style={{ borderColor: color }}>
      <div className="stat-card__title">{title}</div>
      <div className="stat-card__value">{value}</div>
    </div>
  )
}

function Dashboard() {
  const { user } = useAuth()
  const [tiles, setTiles] = React.useState(null)

  React.useEffect(() => {
    // Use existing endpoints for dashboard widgets
    Promise.all([
      fetch('/recent-sale', { credentials: 'include' }).then((r) => r.json()),
      fetch('/recent-purchase', { credentials: 'include' }).then((r) => r.json()),
      fetch('/recent-quotation', { credentials: 'include' }).then((r) => r.json()),
      fetch('/recent-payment', { credentials: 'include' }).then((r) => r.json()),
    ]).then(([sales, purchases, quotes, payments]) => {
      setTiles({ sales, purchases, quotes, payments })
    })
  }, [])

  return (
    <div className="dashboard">
      <DashNav />
      <div className="dashboard__grid">
        <StatCard title="Sales" value={tiles?.sales?.length ?? 0} color="#733686" />
        <StatCard title="Purchases" value={tiles?.purchases?.length ?? 0} color="#ff8952" />
        <StatCard title="Quotations" value={tiles?.quotes?.length ?? 0} color="#00c689" />
        <StatCard title="Payments" value={tiles?.payments?.length ?? 0} color="#297ff9" />
      </div>
      <div className="dashboard__panels">
        <RoundedPanel title="Recent Sales">
          <List items={tiles?.sales} fields={["created_at","reference_no","name","grand_total"]} />
        </RoundedPanel>
        <RoundedPanel title="Recent Purchases">
          <List items={tiles?.purchases} fields={["created_at","reference_no","name","grand_total"]} />
        </RoundedPanel>
      </div>
    </div>
  )
}

function List({ items, fields }) {
  if (!items) return null
  return (
    <div className="list">
      {items.map((it, idx) => (
        <div key={idx} className="list__row">
          {fields.map((f) => (
            <div key={f} className="list__cell">{String(it[f] ?? '')}</div>
          ))}
        </div>
      ))}
    </div>
  )
}

function RoundedPanel({ title, children }) {
  return (
    <div className="panel">
      <div className="panel__header">{title}</div>
      <div className="panel__body">{children}</div>
    </div>
  )
}

function DashNav() {
  const [open, setOpen] = React.useState(false)
  return (
    <div className="dashnav">
      <button aria-label="Open menu" className="icon-btn" onClick={() => setOpen(!open)}>
        <i className="fas fa-bars" />
      </button>
      <div className="dashnav__brand">Dashboard</div>
      {open && (
        <div className="sidebar">
          <Link to="/dashboard">Overview</Link>
          <a href="/sales">Sales</a>
          <a href="/purchases">Purchases</a>
        </div>
      )}
    </div>
  )
}
