import { useUser } from "@clerk/nextjs"
import type React from "react"
import Persona from "~/components/Persona"
import Sidebar from "~/components/Sidebar"

const Layout = ({ children }: { children: React.ReactNode }) => {
  const { isSignedIn } = useUser()
  return(
    <>
    {isSignedIn || children}
    {!isSignedIn ||
      <div className="grid grid-cols-22 p-10 w-screen h-screen extra:min-w-xl">
        <Sidebar />

        <main id="dashboardContent" className="col-span-16 mx-10 overflow-y-auto scrollbar">
          {children}
        </main>

        <Persona colSpan="col-span-5" />
      </div>
    }</>
  )
}

export default Layout