type parallax = {
  enabled: option<bool>,
  shiftDistanceX: option<float>,
  shiftDistanceY: option<float>,
  tiltAngle: option<float>,
  magnification: option<float>,
  pressMagnification: option<float>,
  pressDuration: option<float>,
  pressDelay: option<float>,
}

@obj
external // @deprecated("Directly create record instead")
parallax: (
  ~enabled: bool=?,
  ~shiftDistanceX: float=?,
  ~shiftDistanceY: float=?,
  ~tiltAngle: float=?,
  ~magnification: float=?,
  ~pressMagnification: float=?,
  ~pressDuration: float=?,
  ~pressDelay: float=?,
  unit,
) => parallax = ""
