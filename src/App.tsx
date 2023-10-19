import { useState } from "react"

const buttonColorProps =
  "p-3 rounded-md bg-slate-200 hover:bg-slate-100 transition-colors disabled:bg-slate-100"

export default function App() {
  const [count, setCount] = useState<number>(0)

  function inc() {
    setCount(count + 1)
  }

  function dec() {
    setCount(count > 0 ? count - 1 : 0)
  }

  function reset() {
    setCount(0)
  }

  return (
    <div className="p-10 flex flex-col items-center gap-10">
      <h1 className="text-4xl">Vite + Tailwind app</h1>
      <p className="font-bold text-xl">Count: {count}</p>
      <div className="flex gap-4">
        <button className={buttonColorProps} onClick={inc}>
          +
        </button>
        <button
          className={buttonColorProps}
          onClick={dec}
          disabled={count === 0}
        >
          -
        </button>
        <button className={buttonColorProps} onClick={reset}>
          Reset
        </button>
      </div>
      <span>
        ENV:{" "}
        {import.meta.env.VITE_TEST ? (
          <span className="font-bold text-green-500">
            {import.meta.env.VITE_TEST}
          </span>
        ) : (
          <span className="font-bold text-red-500">Failed :(</span>
        )}
      </span>
    </div>
  )
}
