function varargout = get_parameter_information(varargin)
  [varargout{1:max(1,nargout)}] = CoolPropMATLAB_wrap(90,varargin{:});
end
