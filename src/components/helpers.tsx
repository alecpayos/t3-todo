export const activateSidebarItem = (url: string) => {
  const links = [ ...document.querySelectorAll('a') ]

  const removeActivatorClasses = () => {
    links.forEach(link => {
      link.parentElement?.classList.remove('border-l-8')
      link.children[0]?.classList.remove('left-[-4px]')
    })
  }

  const attachActivatorClasses = (index: number) => {
    removeActivatorClasses()
    links[index]?.parentElement?.classList.add('border-l-8')
    links[index]?.children[0]?.classList.add('left-[-4px]')
  }

  switch(url) {
    case "/dashboard":
      removeActivatorClasses()
      break
    case "/scans":
      attachActivatorClasses(1)
      break
    case "/upload":
      attachActivatorClasses(2)
      break
    case "/account":
      attachActivatorClasses(3)
      break
  }
}

export const attachScrollHandler = () => {
  const content = document.getElementById('dashboardContent') as HTMLElement
  content.onscroll = (event: Event) => {
    const { scrollTop } = (event?.target as HTMLElement)
    return scrollTop
  }
}