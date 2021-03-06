/// 防抖Effect鉤子
/// v1 - 修正 deps 報錯異常
/// v0

import { useEffect } from 'react'

export const useDebounce = (callback, deps, delay = 500) => {
	useEffect(() => {
		const handler = setTimeout(() => callback(), delay)
		return () => clearTimeout(handler)
	}, [...deps ?? [], delay])
}
