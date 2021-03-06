import { createContext, useContext, useMemo } from 'react'
import { createHttp } from '@/core/hooks/http/create-http'
import { AxiosInstance } from 'axios'

export { HttpProvider, useHttp }

const context = createContext(null)

function HttpProvider({ children }) {
	const service = useMemo(() => {
		const _service = createHttp()

		_service.http.interceptors.response.use(
			response => {
				return response
			},
			error => {
				// 統一 try/catch
				const res = error.response
				// if (res && res.data) {
				// 	message.error(res.data.message)
				// }
				return Promise.resolve(res)
			},
		)

		return _service
	}, [])

	return <context.Provider value={service}>{children}</context.Provider>
}

/**
 * @return {{http: AxiosInstance}}
 */
function useHttp() {
	return useContext(context)
}
