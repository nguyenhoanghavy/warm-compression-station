function v = CONFIGURATION_STRING_TYPE()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = CoolPropMATLAB_wrap(0, 139);
  end
  v = vInitialized;
end
