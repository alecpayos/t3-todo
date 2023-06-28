import { type NextPage } from "next"
import { useUser } from "@clerk/nextjs"
import { SignInButton } from "@clerk/nextjs"
import { useRouter } from "next/router"

const Login: NextPage = () => {
  const { isSignedIn } = useUser() 
  const router = useRouter()

  if(isSignedIn) {
    void router.push('/dashboard')
    return <></>;
  }

  return (
    <>
      {isSignedIn || <main className="flex min-h-screen flex-col items-center justify-center bg-gradient-to-b from-[#2e026d] to-[#15162c]">
        <div className="container flex flex-col items-center justify-center gap-12 px-4 py-16 ">
          <h1 className="text-5xl font-extrabold tracking-tight text-white sm:text-[5rem]">
            <span className="text-[hsl(280,100%,70%)] me-5">T3</span>
            <span className="text-[hsl(310,100%,70%)] me-5">TO-DO</span>  
            <span className="text-[hsl(250,100%,70%)]">App</span>
          </h1>
          <div className="py-2 text-sm font-medium px-5 bg-slate-100 rounded-lg cursor-pointer">
            {!isSignedIn && <SignInButton afterSignInUrl="/dashboard" />}
          </div>
        </div>
      </main>}
    </>
  )
}

export default Login