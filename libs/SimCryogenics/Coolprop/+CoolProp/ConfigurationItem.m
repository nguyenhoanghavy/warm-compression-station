classdef ConfigurationItem < SwigRef
  methods
    function self = ConfigurationItem(varargin)
      if nargin~=1 || ~ischar(varargin{1}) || ~strcmp(varargin{1},'_swigCreate')
        % How to get working on C side? Commented out, replaed by hack below
        %self.swigInd = CoolPropMATLAB_wrap(322, varargin{:});
        tmp = CoolPropMATLAB_wrap(322, varargin{:}); % FIXME
        self.swigInd = tmp.swigInd;
        tmp.swigInd = uint64(0);
      end
    end
    function varargout = set_bool(self,varargin)
      [varargout{1:nargout}] = CoolPropMATLAB_wrap(323, self, varargin{:});
    end
    function varargout = set_integer(self,varargin)
      [varargout{1:nargout}] = CoolPropMATLAB_wrap(324, self, varargin{:});
    end
    function varargout = set_double(self,varargin)
      [varargout{1:nargout}] = CoolPropMATLAB_wrap(325, self, varargin{:});
    end
    function varargout = set_string(self,varargin)
      [varargout{1:nargout}] = CoolPropMATLAB_wrap(326, self, varargin{:});
    end
    function varargout = get_key(self,varargin)
      [varargout{1:max(1,nargout)}] = CoolPropMATLAB_wrap(327, self, varargin{:});
    end
    function delete(self)
      if self.swigInd
        CoolPropMATLAB_wrap(328, self);
        self.swigInd=uint64(0);
      end
    end
  end
  methods(Static)
  end
end
