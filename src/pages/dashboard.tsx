import { type NextPage } from "next"
import { SignOutButton, useUser } from "@clerk/nextjs"
import { useEffect } from "react"
import { useRouter } from "next/router"
import { generateCards } from "./components/dashboard/cards"

const Dashboard: NextPage = () => {
  const { isSignedIn, user } = useUser()
  const router = useRouter()

  useEffect(() => {
    console.log(process.env)
    isSignedIn || router.push('/')
  }, [isSignedIn])

  return(
    <section className="
      grid
      grid-rows-12
      gap-4
      h-full
      mt-1
    ">
      <h1 className="text-32 row-span-1 font-bold font-sans text-purple-1000 sticky z-10 top-0 bg-greeting shadow-cyan-300">Good morning, {user ? user.firstName : "User"}!</h1>
      
      <div className="row-span-3 flex w-full">{ generateCards() }</div>

      <div className="row-span-5 flex w-full mt-8">
        <div className="flex flex-col mr-8 justify-between">
          <div className="card rect-3xl-half mb-4"></div>
          <div className="card rect-3xl-half mt-4"></div>
        </div>

        <div className="card rect-5xl-full"></div>
      </div>

      <div className="row-span-3 mt-8">
        <div className="card h-[500px]"></div>
      </div>
      {isSignedIn && <SignOutButton />}
    </section>
  )
}

export default Dashboard