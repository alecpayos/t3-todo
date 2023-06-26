import Image from "next/image"

import cash from "public/assets/cash.svg"
import trendUp from "public/assets/trend-up.svg"
import report from "public/assets/report.svg"
import dismiss from "public/assets/dismiss.svg"
import incidental from "public/assets/danger.svg"
import menu from "public/assets/ellipseVertical.svg"

export const generateCards = () => {
  const hardValues = [ '$27,348', 2384, 1743, '12.96%', 1859 ]
  const icons = [ cash, trendUp, report, dismiss, incidental ]
  const titles = [
    "Revenue trajectory this month",
    "Report pace trajectory",
    "Report completed this month",
    "Scans dismissed in the last 30 days",
    "Total incidental findings"
  ]

  const alts = [
    'Revenue icon',
    'Pace trajectory icon',
    'Report generated icon',
    'Dismissed scans icon',
    'Incidental findings icon'
  ]

  return titles.map((title, idx) => {
    return(
      <div key={idx} className="card square-3xl mr-8 flex flex-col p-8">
        <div className="flex justify-between">
          <Image width={48} height={48} src={icons[idx]} alt={alts[idx] as string} />
          <Image width={32} style={{ height: '32px' }} src={menu} alt="vertical ellipse menu" className="hover:bg-slate-100 hover:rounded-full relative right-[-12px]" />
        </div>
        <p className="mt-4 text-3xl font-semibold text-purple-1000">{hardValues[idx]}</p>
        <p className="mt-2 text-purple-1000">{title}</p>
      </div>
    )
  })
}