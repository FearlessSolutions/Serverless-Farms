---
to: ui/src/components/<%= name %>s.js
sh: cd .. && pnpm install @trussworks/react-uswds
---
import {useEffect, useState} from "react";
import {get<%= Name %>s} from "../helpers/api";
import {Link} from "react-router-dom"
import {Table} from "@trussworks/react-uswds"

const <%= Name %>s = () =>{
    const [<%= name %>, set<%= Name %>] = useState([]);

    useEffect(() => {
        const fetchData = async () => {
          const result = await get<%= Name %>s()

          set<%= Name %>s(Object.values(result));
        };
        fetchData();
    }, []);
    return (
        <div>
            This is the <%= Name %>s Page

            <div>
                <Table bordered fullWidth caption="<%= Name %>s:">
                    <thead>
                        <tr >
                            <th scope={"col"}>
                                ID
                            </th>
                            <th scope={"col"}>
                                Data
                            </th>
                            <th scope={"col"}>
                                Created At
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {<%= name %>s.map(cow =>{
                            const createdAt = new Date(<%= name %>.createdAt * 1000)
                            return (
                                <tr>
                                    <th scope={"col"}>
                                        <Link to={`/<%= name %>/${<%= name %>.id}`}>{cow.id}</Link>
                                    </th>
                                    <th scope={"col"}>
                                        {JSON.stringify(<%= name %>.data)}
                                    </th>
                                    <th scope={"col"}>
                                        {createdAt.toLocaleString()}
                                    </th>
                                </tr>
                            )
                        })
                        }
                    </tbody>
                </Table>
            </div>
        </div>
    )
}

export default <%= Name %>s