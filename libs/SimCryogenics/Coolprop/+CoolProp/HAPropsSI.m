function varargout = HAPropsSI(varargin)
  [varargout{1:max(1,nargout)}] = CoolPropMATLAB_wrap(343,varargin{:});
end