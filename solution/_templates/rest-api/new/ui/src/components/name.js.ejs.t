---
to: ui/src/components/<%= name %>.js
---
import {useEffect, useState} from "react";
import {get<%= Name %>, put<%= Name %>, delete<%= Name %>, new<%= Name %>} from "../helpers/api";
import {useParams, useHistory} from "react-router-dom";
import {TextInput, Button} from "@trussworks/react-uswds"


const <%= Name %> = () => {
    let { id } = useParams()
    const history = useHistory();
    const [<%= name %>, set<%= Name %>] = useState({data:{}});
    const [updated<%= Name %>, setUpdated<%= Name %>] = useState()

    useEffect(() => {
        const fetchData = async () => {
            const result = await get<%= Name %>(id)
            set<%= Name %>(result);
            setUpdated<%= Name %>(result)
        };
        fetchData();
    }, []);

    const updateForm = (field, value) =>{
        let newResult = JSON.parse(JSON.stringify(updated<%= Name %>))
        newResult.data[field] = value
        setUpdated<%= Name %>(newResult)
    }

    const <%= name %>Update = async() =>{
        await put<%= Name %>(id, updated<%= Name %>.data)
        history.push('/<%= name %>s')
    }

    const <%= name %>Delete = async() =>{
        await delete<%= Name %>(id)
        history.push('/<%= name %>s')

    }

    const <%= name %>New = async() =>{
        await new<%= Name %>(updated<%= Name %>.data)
        history.push('/<%= name %>s')
    }

    return (
        <div>
            This is the <%= Name %> Page for <%= Name %>: { id }
            <div>
                {Object.keys(<%= name %>.data).map(field =>{
                    return (
                        <div key={`input-group-${field}`}>
                            <label htmlFor={`input-${field}`}>{field}: </label>
                            <TextInput
                                id={`input-${field}`}
                                name={`input-${field}`}
                                type="text"
                                defaultValue={<%= name %>.data[field]}
                                onChange={e =>{updateForm(field, e.target.value )}}
                            />
                        </div>
                    )
                })}
            </div>
            <Button type="button" onClick={<%= name %>Update}>Update <%= Name %></Button>
            <Button type="button" onClick={<%= name %>Delete}>Delete <%= Name %></Button>
            <Button type="button" onClick={<%= name %>New}>Create New <%= Name %></Button>
        </div>
    )
}

export default <%= Name %>