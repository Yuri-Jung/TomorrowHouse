import { BrowserRouter, Switch, Route, Link } from "react-router-dom";
import View from './pages/View/View';
import Write from '../src/pages/Write/Write'



function App() {
    return (
        <BrowserRouter>
            <div>
                <nav>
                    <ul>
                        <li>
                            <Link to="/Write">작성</Link>{/* Link 컴포넌트를 이용하여 경로를 연결합니다 */}
                        </li>
                        <li>
                            <Link to="/view">글</Link>
                        </li>
                    </ul>
                </nav>

                <Switch>
                    <Route exact path="/Write">
                        <Write />
                    </Route>
                    <Route path="/view">
                        <View />
                    </Route>
                </Switch>
            </div>
        </BrowserRouter>
    );
}



export default App;