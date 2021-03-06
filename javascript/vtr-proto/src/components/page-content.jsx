import { createClassName } from '75l'

export const PageContent = ({ className, children }) => {
	return (
		<main
			className={createClassName({
				'p-4 bg-white shadow-md rounded-md m-4': true,
				[className]: className != null,
			})}
		>
			{children}
		</main>
	)
}
