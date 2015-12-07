/*
 * =BEGIN CLOSED LICENSE
 *
 *  Copyright(c) 2014 Andras Csizmadia.
 *  http://www.vpmedia.eu
 *
 *  For information about the licensing and copyright please
 *  contact Andras Csizmadia at andras@vpmedia.eu.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 *
 * =END CLOSED LICENSE
 */
package hu.vpmedia.tests.cases
{
    import flash.display.Sprite;
    import org.flexunit.Assert;

    public class SampleTestCase extends Sprite
    {
        private var subject:Main;

        public function SampleTestCase()
        {
            super();
        }

        //--------------------------------------------------------------------------
        //
        //  Before and After
        //
        //--------------------------------------------------------------------------

        [Before]
        public function runBeforeEveryTest():void
        {
            // implement
        }

        [After]
        public function runAfterEveryTest():void
        {
            // implement
        }

        //--------------------------------------------------------------------------
        //
        //  Tests
        //
        //--------------------------------------------------------------------------

        [Test]
        public function run():void
        {
            subject=new Main();
            addChild(subject);
            removeChild(subject);
        }
    }
}
