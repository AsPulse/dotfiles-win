import { Snippet } from 'https://deno.land/x/tsnip_vim@v0.5/mod.ts';

const state: Snippet = {
  name: 'Snippet of React useState',
  params: [
    {
      name: 'name',
      type: 'single_line',
    },
    {
      name: 'defaultValue',
      type: 'single_line',
    },
    {
      name: 'type',
      type: 'single_line',
    }
  ],
  render: ({ name, defaultValue, type }) =>
    `const [${name?.text ?? ''}, set${
      name != null
        ? `${name.text?.charAt(0).toUpperCase()}${name.text?.slice(1)}`
        : ''
    }] = useState${type != null && type.text !== '' ? `<${type.text}>` : ''}(${defaultValue?.text ?? ''});`,
};

export default {
  state,
};
