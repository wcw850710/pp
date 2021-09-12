import { Header } from '@/core/components/layout/header'
import { Menu } from '@/core/components/layout/menu'
import { useMemo } from 'react'
import { LayoutProvider } from '@/core/components/layout/service'
import { ERole } from '@/enums/role'

export const Layout = ({ children }) => {
	const menus = useMemo(
		() => [
			{
				icon: <i className="fas fa-user" />,
				name: '個人資訊管理',
				children: [{ name: '帳戶設定', to: '/user/setting' }],
			},
			{
				icon: <i className="fas fa-users" />,
				name: '會員管理',
				to: '/users',
				role: [ERole.ADMIN],
			},
		],
		[],
	)

	return (
		<LayoutProvider>
			<div className="bg-gray-200 min-w-full min-h-screen flex flex-col">
				<Header />
				<div className="flex flex-1">
					<Menu data={menus} />
					<div className="flex-1">{children}</div>
				</div>
			</div>
		</LayoutProvider>
	)
}
