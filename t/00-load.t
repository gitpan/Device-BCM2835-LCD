use Device::BCM2835::LCD;

$foo = Device::BCM2835::LCD->new();
$foo->init(Display => 2004);
$foo->PutMsg("Device::BCM2835::LCD");
$foo->SetPos(2,0);
$foo->PutMsg("version 0.1");
$foo->SetPos(4,0);
$foo->PutMsg("Bignum demo in ");
for ($i = 9; $i > 0; $i--)
	{
	$foo->SetPos(4,15);
	$foo->PutMsg($i);
	sleep(1);
	}
$foo->cmd(1);
$foo->SetPos(1,0);
$foo->PutMsg("Loading custom");
$foo->SetPos(2,0);
$foo->PutMsg("CGRAM characters");
$foo->LoadCGRAM;
$foo->delay(1000);

for ($i = 0 ; $i < 10 ; $i++)
{
$foo->cmd(1);
$foo->cmd(0x81);
$foo->BigNum(0,$i);
$foo->delay(500);
}
$foo->delay(500);
$foo->cmd(1);
$foo->cmd(0x81);
for ($k = 0; $k < 100; $k++)
{
$num = "00" . $k;
$j = substr($num,-3,3);
$foo->BigNum(0,0);
$foo->BigNum(1,substr($j,0,1));
$foo->BigNum(2,substr($j,1,1));
$foo->BigNum(3,substr($j,2,1));
$foo->SetPos(1,17);
$foo->PutMsg($j);
$foo->delay(25);
}
$foo->cmd(1);
$foo->delay(100);
for ($i = 0; $i < 10; $i++)
{
$foo->BigNum(0,$i);
$foo->BigNum(1,$i);
$foo->BigNum(2,$i);
$foo->BigNum(3,$i);
$foo->BigNum(4,$i);
$foo->delay(250);
$foo->SetPos(1,0);
$foo->PutMsg("$i" x 80);
$foo->delay(250);
$foo->cmd(1);
$foo->delay(5);


}	
$foo->cmd(1);
$foo->SetPos(1,0);
$foo->PutMsg("LCD demo complete.");
for ($i = 0; $i < 10; $i++)
	{
	$foo->cmd(8);
	$foo->delay(300);
	$foo->cmd(12);
	$foo->delay(300);
	}
