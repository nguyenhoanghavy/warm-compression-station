function varargout = is_valid_parameter(varargin)
  [varargout{1:max(1,nargout)}] = CoolPropMATLAB_wrap(94,varargin{:});
end
