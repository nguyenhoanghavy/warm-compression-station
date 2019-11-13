disp([num2str('**************** INFORMATION ***************')]);
disp([num2str('This example was auto-generated by the language-agnostic dev/scripts/example_generator.py script written by Ian Bell')]);
disp([num2str('CoolProp version:'), ' ', num2str(CoolProp.get_global_param_string('version'))]);
disp([num2str('CoolProp gitrevision:'), ' ', num2str(CoolProp.get_global_param_string('gitrevision'))]);
disp([num2str('CoolProp Fluids:'), ' ', num2str(CoolProp.get_global_param_string('FluidsList'))]);
% See http://www.coolprop.org/coolprop/HighLevelAPI.html#table-of-string-inputs-to-propssi-function for a list of inputs to high-level interface;
disp([num2str('*********** HIGH LEVEL INTERFACE *****************')]);
disp([num2str('Critical temperature of water:'), ' ', num2str(CoolProp.Props1SI('Water', 'Tcrit')), ' ', num2str('K')]);
disp([num2str('Boiling temperature of water at 101325 Pa:'), ' ', num2str(CoolProp.PropsSI('T', 'P', 101325, 'Q', 0, 'Water')), ' ', num2str('K')]);
disp([num2str('Phase of water at 101325 Pa and 300 K:'), ' ', num2str(CoolProp.PhaseSI('P', 101325, 'Q', 0, 'Water'))]);
disp([num2str('c_p of water at 101325 Pa and 300 K:'), ' ', num2str(CoolProp.PropsSI('C', 'P', 101325, 'T', 300, 'Water')), ' ', num2str('J/kg/K')]);
disp([num2str('c_p of water (using derivatives) at 101325 Pa and 300 K:'), ' ', num2str(CoolProp.PropsSI('d(H)/d(T)|P', 'P', 101325, 'T', 300, 'Water')), ' ', num2str('J/kg/K')]);
disp([num2str('*********** HUMID AIR PROPERTIES *****************')]);
disp([num2str('Humidity ratio of 50% rel. hum. air at 300 K, 101325 Pa:'), ' ', num2str(CoolProp.HAPropsSI('W', 'T', 300, 'P', 101325, 'R', 0.5)), ' ', num2str('kg_w/kg_da')]);
disp([num2str('Relative humidity from last calculation:'), ' ', num2str(CoolProp.HAPropsSI('R', 'T', 300, 'P', 101325, 'W', CoolProp.HAPropsSI('W', 'T', 300, 'P', 101325, 'R', 0.5))), ' ', num2str('(fractional)')]);
disp([num2str('*********** INCOMPRESSIBLE FLUID AND BRINES *****************')]);
disp([num2str('Density of 50% (mass) ethylene glycol/water at 300 K, 101325 Pa:'), ' ', num2str(CoolProp.PropsSI('D', 'T', 300, 'P', 101325, 'INCOMP::MEG-50%')), ' ', num2str('kg/m^3')]);
disp([num2str('Viscosity of Therminol D12 at 350 K, 101325 Pa:'), ' ', num2str(CoolProp.PropsSI('V', 'T', 350, 'P', 101325, 'INCOMP::TD12')), ' ', num2str('Pa-s')]);
% If you don't have REFPROP installed, disable the following lines;
disp([num2str('*********** REFPROP *****************')]);
disp([num2str('Critical temperature of water:'), ' ', num2str(CoolProp.Props1SI('REFPROP::Water', 'Tcrit')), ' ', num2str('K')]);
disp([num2str('Boiling temperature of water at 101325 Pa:'), ' ', num2str(CoolProp.PropsSI('T', 'P', 101325, 'Q', 0, 'REFPROP::Water')), ' ', num2str('K')]);
disp([num2str('c_p of water at 101325 Pa and 300 K:'), ' ', num2str(CoolProp.PropsSI('C', 'P', 101325, 'T', 300, 'REFPROP::Water')), ' ', num2str('J/kg/K')]);
disp([num2str('*********** TABULAR BACKENDS *****************')]);
TAB = CoolProp.AbstractState.factory('BICUBIC&HEOS', 'R245fa');
TAB.update(CoolProp.PT_INPUTS, 101325, 300);
disp([num2str('Mass density of refrigerant R245fa at 300 K, 101325 Pa:'), ' ', num2str(TAB.rhomass()), ' ', num2str('kg/m^3')]);
disp([num2str('*********** SATURATION DERIVATIVES (LOW-LEVEL INTERFACE) ***************')]);
AS_SAT = CoolProp.AbstractState.factory('HEOS', 'R245fa');
AS_SAT.update(CoolProp.PQ_INPUTS, 101325, 0);
disp([num2str('First saturation derivative:'), ' ', num2str(AS_SAT.first_saturation_deriv(CoolProp.iP, CoolProp.iT)), ' ', num2str('Pa/K')]);
disp([num2str('*********** LOW-LEVEL INTERFACE *****************')]);
AS = CoolProp.AbstractState.factory('HEOS', 'Water&Ethanol');
z = CoolProp.DoubleVector(); z.push_back(0.5); z.push_back(0.5);;
AS.set_mole_fractions(z);
AS.update(CoolProp.PQ_INPUTS, 101325, 1);
disp([num2str('Normal boiling point temperature of water and ethanol:'), ' ', num2str(AS.T()), ' ', num2str('K')]);
% If you don't have REFPROP installed, disable the following block;
disp([num2str('*********** LOW-LEVEL INTERFACE (REFPROP) *****************')]);
AS2 = CoolProp.AbstractState.factory('HEOS', 'Hydrogen');
z2 = CoolProp.DoubleVector(); z2.push_back(0.2); z2.push_back(0.8);
AS2.set_mole_fractions(z2);
AS2.update(CoolProp.QT_INPUTS, 1, 120);
disp([num2str('Vapor molar density:'), ' ', num2str(AS2.keyed_output(CoolProp.iDmolar)), ' ', num2str('mol/m^3')]);

T = 1:100;
P = 0.1:0.1:10;
for j=1:length(P)
    for i=1:length(T)
        H(i,j) = CoolProp.PropsSI('U', 'P', P(j)*1e5, 'T', T(i), 'Hydrogen');
    end
end