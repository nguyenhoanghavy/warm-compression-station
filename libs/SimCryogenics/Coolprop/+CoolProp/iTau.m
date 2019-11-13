function v = iTau()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = CoolPropMATLAB_wrap(0, 24);
  end
  v = vInitialized;
end
