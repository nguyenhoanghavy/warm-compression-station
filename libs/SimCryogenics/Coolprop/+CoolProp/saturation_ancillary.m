function varargout = saturation_ancillary(varargin)
  [varargout{1:max(1,nargout)}] = CoolPropMATLAB_wrap(252,varargin{:});
end
