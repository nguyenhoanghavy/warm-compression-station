function v = iPIP()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = CoolPropMATLAB_wrap(0, 61);
  end
  v = vInitialized;
end
