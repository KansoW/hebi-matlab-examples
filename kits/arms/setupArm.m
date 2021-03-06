function [ group, kin, gravityVec ] = setupArm()

% NOTE: CHANGE AS NEEDED TO MATCH YOUR CONFIGURATION

% Communications
group = HebiLookup.newGroupFromNames('Arm', {
   'Base'
   'Shoulder'
   'Elbow'
   'Wrist1'
   'Wrist2'
});

% Kinematics
kin = HebiKinematics();
kin.addBody('X5-4');
kin.addBody('X5-HeavyBracket', 'mount', 'right-outside');
kin.addBody('X5-9');
kin.addBody('X5-Link', 'extension', .325, 'twist', pi);
kin.addBody('X5-9');
kin.addBody('X5-Link', 'extension', .325, 'twist', pi);
kin.addBody('X5-1');
kin.addBody('X5-LightBracket', 'mount', 'right');
kin.addBody('X5-1');
kin.addBody('X5-LightBracket', 'mount', 'right');

% Determine gravity vector (assumes fixed base)
fbk = group.getNextFeedback();
gravityVec = -[fbk.accelX(1) fbk.accelY(1) fbk.accelZ(1)];

end

