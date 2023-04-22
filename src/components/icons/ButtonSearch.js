import * as React from "react"
import Svg, { G, Rect, Path, Defs, ClipPath } from "react-native-svg"
const SvgComponent = () => (
  <Svg xmlns="http://www.w3.org/2000/svg" width={46} height={46} fill="none">
    <G clipPath="url(#a)">
      <Rect width={46} height={46} fill="#6750A4" rx={23} />
      <Path
        fill="#fff"
        d="m15.06 33.538-1.326-1.428 4.148-4.08a8.502 8.502 0 0 1-1.394-2.38 8.044 8.044 0 0 1-.442-2.686c0-1.45.351-2.765 1.054-3.944a8.113 8.113 0 0 1 2.89-2.856 7.489 7.489 0 0 1 3.944-1.088c1.45 0 2.765.363 3.944 1.088a7.844 7.844 0 0 1 2.856 2.856c.725 1.179 1.088 2.493 1.088 3.944a7.489 7.489 0 0 1-1.088 3.944 8.113 8.113 0 0 1-2.856 2.89c-1.179.703-2.493 1.054-3.944 1.054a7.905 7.905 0 0 1-2.448-.374 7.639 7.639 0 0 1-2.176-1.122l-4.25 4.182Zm8.874-4.828c1.043 0 1.995-.25 2.856-.748a5.961 5.961 0 0 0 2.108-2.074 5.65 5.65 0 0 0 .782-2.924c0-1.065-.26-2.029-.782-2.89A5.687 5.687 0 0 0 26.824 18c-.861-.521-1.825-.782-2.89-.782A5.65 5.65 0 0 0 21.01 18a5.687 5.687 0 0 0-2.074 2.074c-.499.861-.748 1.825-.748 2.89 0 1.065.25 2.04.748 2.924a6.054 6.054 0 0 0 2.074 2.074c.884.499 1.859.748 2.924.748Z"
      />
    </G>
    <Defs>
      <ClipPath id="a">
        <Rect width={46} height={46} fill="#fff" rx={23} />
      </ClipPath>
    </Defs>
  </Svg>
)
export default SvgComponent
