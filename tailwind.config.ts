import { type Config } from "tailwindcss";

export default {
  content: ["./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    screens: {
      'extra': '1921px',
    },
    minWidth: {
      'xl': '1920px',
    },
    extend: {
      square: {
        sm: ''
      },
      borderRadius: {
        '4xl': '2rem',
        '5xl': '2.5rem',
        '6xl': '3rem',
      },
      gridTemplateRows: {
        '8': 'repeat(8, minmax(0, 1fr))',
        '10': 'repeat(10, minmax(0, 1fr))',
        '12': 'repeat(12, minmax(0, 1fr))',
      },
      gridTemplateColumns: {
        '20': 'repeat(20, minmax(0, 1fr))',
        '22': 'repeat(22, minmax(0, 1fr))',
        '24': 'repeat(24, minmax(0, 1fr))',
      },
      gridRowStart: {
        '8': '8',
        '9': '9',
        '10': '10',
        '11': '11',
        '12': '12',
        '13': '13',
      },
      gridColumn: {
        'span-13': 'span 13 / span 13',
        'span-14': 'span 14 / span 14',
        'span-15': 'span 15 / span 15',
        'span-16': 'span 16 / span 16',
        'span-17': 'span 17 / span 17',
        'span-18': 'span 18 / span 18',
        'span-19': 'span 19 / span 19',
        'span-20': 'span 20 / span 20',
      },
      fontSize: {
        '32': '2rem'
      },
      textColor: {
        'purple-1000': 'rgb(20,16,69)',
      },
      backgroundColor: {
        greeting: '#F7FAFC',
        sidebar: 'rgb(111,106,248)',
      },
      boxShadow: {
        heavy: '0 2px 8px 0 rgb(112, 109, 251, 0.8)',
      }
    },
  },
  plugins: [],
} satisfies Config;
