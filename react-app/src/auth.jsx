import React from 'react'

const AuthContext = React.createContext(null)

export function AuthProvider({ children }) {
  const [user, setUser] = React.useState(null)
  const [loading, setLoading] = React.useState(true)

  React.useEffect(() => {
    fetch('/me', { credentials: 'include' })
      .then((r) => (r.ok ? r.json() : null))
      .then((data) => setUser(data))
      .finally(() => setLoading(false))
  }, [])

  const value = React.useMemo(() => ({ user, setUser, loading }), [user, loading])
  return React.createElement(AuthContext.Provider, { value }, children)
}

export function useAuth() {
  return React.useContext(AuthContext)
}

export function RequireAuth({ allowRoles, children }) {
  const { user, loading } = useAuth()
  if (loading) return null
  if (!user) {
    window.location.href = '/login'
    return null
  }
  if (allowRoles && allowRoles.length) {
    const userRoles = new Set([String(user.role_id), ...(user.roles || [])])
    const allowed = allowRoles.some((r) => userRoles.has(String(r)))
    if (!allowed) return null
  }
  return children
}
