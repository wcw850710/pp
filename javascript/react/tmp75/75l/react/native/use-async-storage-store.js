/// 本地緩存單一數據管理
/// v0

import AsyncStorage from '@react-native-async-storage/async-storage'
import { useSafeState } from '../common/use-safe-state'
import { useCallback, useEffect } from 'react'

export const useAsyncStorageStore = (appName, initialStore) => {
	const [store, setStore] = useSafeState(null)

	let initStore
	initStore = useCallback(async () => {
		const store = {}
		const promiseGetItems = []
		for (const k in initialStore) {
			promiseGetItems.push(
				new Promise(resolve => {
					AsyncStorage.getItem(appName + '_' + k, (err, value) =>
						resolve({ key: k, value }),
					)
				}),
			)
		}
		const keyValues = await Promise.all(promiseGetItems)
		keyValues.forEach(({ key, value }) => {
			if (value == null) {
				return (store[key] = initialStore[key])
			}
			try {
				store[key] = JSON.parse(value)
			} catch (err) {
				store[key] = initialStore[key]
			}
		})
		setStore(store)
	}, [AsyncStorage, appName, initialStore, setStore])

	const updateStore = useCallback(
		(key, value) => {
			setStore(e => ({ ...e, [key]: value }))

			const storageKey = appName + '_' + key
			if (value == null) {
				AsyncStorage.removeItem(storageKey)
			} else {
				try {
					AsyncStorage.setItem(storageKey, JSON.stringify(value))
				} catch (err) {
					AsyncStorage.removeItem(storageKey)
				}
			}
		},
		[AsyncStorage, appName, setStore],
	)

	useEffect(() => {
		initStore()
	}, [])

	return [store, updateStore]
}
