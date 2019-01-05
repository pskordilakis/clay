import babel from 'rollup-plugin-babel'
import resolve from 'rollup-plugin-node-resolve'
import pkg from './package.json'

export default [
  {
    input: 'src/main.js',
    output: [
      {
        file: `dist/${pkg.name}.cjs.js`,
        format: 'cjs',
        name: `${pkg.name}`,
      },
      {
        file: `dist/${pkg.name}.esm.js`,
        format: 'esm',
        name: `${pkg.name}`,
      },
    ],
    plugins: [
      resolve({
        main: true,
      }),
      babel({
        exclude: ['node_modules/**'],
      }),
    ],
  },
]
