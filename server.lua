local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent('fence:vender')
AddEventHandler( 'fence:vender', function ( args )
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local _src   = source
    local _price = args['Price']
    local _model = args['Tipo']
	local _mens  = args['Mens']
	
	local inv_count = VorpInv.getItemCount(_src, _model)
	
    if inv_count < 1 then
        TriggerClientEvent( 'UI:NotificaVenta', _src, Config.NoInv )
        return
    end

	VorpInv.subItem(_src, _model, 1)
	Character.addCurrency(0, _price)
	
	TriggerClientEvent( 'UI:NotificaVenta', _src, Config.Selltext .. _mens )
	
end)
