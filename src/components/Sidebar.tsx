import Image from "next/image"
import Divider from "./Divider"
import Link from "next/link"
import { useEffect } from "react"
import { useRouter } from "next/router"
import { activateSidebarItem } from "./helpers"

import {
  toothIcon,
  qrIcon,
  uploadIcon,
  accountIcon
} from "^/assets/ImageController"

const Sidebar: React.ElementType = () => {
  const { pathname } = useRouter()

  useEffect(() => {
    activateSidebarItem(pathname)
  }, [pathname])

  return(
    <aside className="
      bg-sidebar
      w-full
      h-full
      rounded-3xl
      shadow-heavy
      grid
      gap-4
      grid-rows-10
      py-4
      relative
    ">
      <section className="w-full flex justify-center">
        <Link href="/dashboard" className="flex">
          <Image src={toothIcon} width={32} height={32} alt="tooth icon" className="cursor-pointer" />
        </Link>
      </section>

      <section className="row-span-2 h-full flex flex-col justify-center items-center relative">
        <Divider width='w-6/12' align="top-[-4px]" />
        <div className="mb-3 flex group justify-center w-full hover:border-l-8">
          <Link href="/scans">
            <Image src={qrIcon} width={32} height={32} alt="scan icon" className="cursor-pointer relative group-hover:left-[-4px]"/>
          </Link>
        </div>
        <div className="mt-3 flex group justify-center w-full hover:border-l-8">
          <Link href="/upload">
            <Image src={uploadIcon} width={32} height={32} alt="upload icon" className="cursor-pointer relative group-hover:left-[-4px]"/>
          </Link>
        </div>
      </section>

      <section className="flex justify-center items-center row-start-10">
        <div className="flex group justify-center w-full hover:border-l-8">
          <Link href="/account">
            <Image src={accountIcon} width={32} height={32} alt="account icon" className="cursor-pointer relative group-hover:left-[-4px]" />
          </Link>
        </div>
      </section>

    </aside>
  )
}

export default Sidebar