function v = FLUID_TYPE_INCOMPRESSIBLE_LIQUID()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = CoolPropMATLAB_wrap(0, 91);
  end
  v = vInitialized;
end
