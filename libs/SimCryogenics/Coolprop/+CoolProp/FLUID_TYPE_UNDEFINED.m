function v = FLUID_TYPE_UNDEFINED()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = CoolPropMATLAB_wrap(0, 93);
  end
  v = vInitialized;
end
