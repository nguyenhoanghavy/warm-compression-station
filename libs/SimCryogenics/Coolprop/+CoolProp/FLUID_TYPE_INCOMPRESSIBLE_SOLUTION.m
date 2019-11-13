function v = FLUID_TYPE_INCOMPRESSIBLE_SOLUTION()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = CoolPropMATLAB_wrap(0, 92);
  end
  v = vInitialized;
end
