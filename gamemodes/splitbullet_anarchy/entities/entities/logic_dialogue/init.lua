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

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

// This is currently unfinished.

// Example dialogue script:
// [{'character':1,'position':1,'text':'I'm a little teapot.','textcolor':[255,255,255,255],'backgroundcolor':[255,0,0,192],'centerx':false,'centery':false,'typewriter':true,'speed':0.5,'input':true,'skip':true}]

// Example character script:
// [{'name':'Uno','image':'splitbullet/characters/uno.png'},{'name':'Dos','image':'splitbullet/characters/dos.png'}]

// This entity sets up the dialogue system on a per-entity basis.
function ENT:KeyValue(key, value)
    local tobejson = value
    string.Replace(tobejson, "'", "\"")
    if key == "dialogscript" then
        self:SetDialogue(tobejson)
    elseif key == "characters" then
        self:SetCharacters(tobejson)
    end
end

function ENT:Initialize()
    
end

// Let's configure the dialogue system!
function ENT:AcceptInput(inputName, activator, caller, data)
    if inputName == "StartDialogue" then
        SetGlobalBool("SplitBullet_DialogueNoInput", false)
        SetGlobalEntity("SplitBullet_DialogueEntity", self)
        SetGlobalBool("SplitBullet_DialogueActive", true)
    elseif inputName == "StopDialogue" then
        SetGlobalBool("SplitBullet_DialogueClose", true)
        SetGlobalBool("SplitBullet_DialogueActive", false)
        SetGlobalEntity("SplitBullet_DialogueEntity", nil)
        SetGlobalBool("SplitBullet_DialogueNoInput", false)
    elseif inputName == "DisableInput" then
        SetGlobalBool("SplitBullet_DialogueNoInput", true)
    end
end
