/*
	Copyright (c) 2021 TidalDevs

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
*/

include("shared.lua")

// Splitting functionality.
function GM:OnSpawnMenuOpen()
    net.Start("SplitBullet.Network.Split")
    net.SendToServer()
end

local dialogent
local dialogue = {}
local characters = {}
local curtext = ""
local curpos = 1
local typewriter = ""
local typewriterpos = 1

local x = 300
local y = 300

local offset = 2

// This is currently unfinished.

/*
// Dialogue system.
hook.Add("HUDPaint", "DrawDialogue", function()
	if GetGlobalBool("SplitBullet_DialogueActive", false) == false then return end
	draw.SimpleText(typewriter, "DermaLarge", 300+(offset), 300+(offset), Color(0,0,0,127), TEXT_ALIGN_CENTER)
    draw.SimpleText(typewriter, "DermaLarge", 300+(offset/2), 300+(offset/2), Color(127,127,127,192), TEXT_ALIGN_CENTER)
    draw.SimpleText(typewriter, "DermaLarge", 300, 15, Color(255,255,255,255), TEXT_ALIGN_CENTER)
end)

// Updating the dialogue text.
hook.Add("Think", "UpdateDialogue", function()
	local active = GetGlobalBool("SplitBullet_DialogueActive", false)
	if active == false then return end

	local ply = LocalPlayer()
	if not IsValid(ply) then return end
	if not ply:Alive() then return end

	// Only draw the dialogue if it's active.
	dialogent = GetGlobalEntity("SplitBullet_DialogueEntity")
	// Invalid entity?
	if not IsValid(dialogent) then 
		resetdialog()
		return
	end

	// Setting the dialogue state.
	dialogue = util.TableToJSON(dialogent:GetDialogue())
	characters = util.TableToJSON(dialogent:GetCharacters())
	curtext = dialogue[curpos].text
	typewriter = string.sub(curtext, 1, typewriterpos)
	if typewriterpos < #curtext then
		typewriterpos = typewriterpos + 1
		chat.PlaySound()
	end
end)

// Change the dialogue position on input.
hook.Add( "PlayerBindPress", "DialoguePositionUpdate", function(ply, bind, pressed)
	if string.find(bind, "+attack") then
		if curpos < #dialogue then
			curpos = curpos + 1
			typewriter = ""
			typewriterpos = 1
		end
	end
end )

function resetdialog()
	dialogent = nil
	dialogue = {}
	characters = {}
	curpos = 1
	curtext = ""
	typewriter = ""
	typewriterpos = 1
end
*/
