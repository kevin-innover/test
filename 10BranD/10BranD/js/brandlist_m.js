

function picBig()
{
    var v = document.getElementById('divCenter');
    v.style.display = "block";
}
function picClose()
{
    var v = document.getElementById('divCenter');
    v.style.display = "none";
}
function checkStatus()
{
    if (action == 'pass')
    {
        ymPrompt.alert(L['change_brand'], null, null, L['tip'], handler)
        return false;
    }
    alert(2)
    return true;
}