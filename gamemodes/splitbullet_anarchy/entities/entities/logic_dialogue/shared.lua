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

ENT.Type            = "point"
ENT.Base 			= "base_point"
ENT.PrintName       = "Split Bullet Dialogue"
ENT.Category 		= "Split Bullet"
ENT.Author 			= "TidalDevs"
ENT.Contact 		= "https://discord.gg/XDVCmQzUGW"
ENT.Purpose 		= "For use in Split Bullet."
ENT.Spawnable		= false

// This is currently unfinished.

// We're setting up network variables here rather than using global vars.
function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "Dialogue")
	self:NetworkVar("String", 1, "Characters")
end
