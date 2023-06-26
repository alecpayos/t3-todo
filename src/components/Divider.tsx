import { NextComponentType } from "next"

const Divider = ({ width, align }: { width: string, align?: string }) => {
  return(
    <div className={`h-1 absolute border-2 ${width} ${align}`}></div>
  )
}

export default Divider