function v = MAXIMUM_TABLE_DIRECTORY_SIZE_IN_GB()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = CoolPropMATLAB_wrap(0, 134);
  end
  v = vInitialized;
end
